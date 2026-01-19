-- Floating terminal (Floaterm) plugin config using your runner functions and mappings
return {
	{
		'voldikss/vim-floaterm',
		init = function()
			vim.g.floaterm_keymap_new    = '<leader>ts'
			vim.g.floaterm_keymap_prev   = '<leader>tp'
			vim.g.floaterm_keymap_next   = '<leader>tn'
			vim.g.floaterm_keymap_toggle = '<leader>tt'
		end,
		config = function()
			local fn = vim.fn

			local function find_makefile()
				-- prefer build/Makefile (searches upwards). fallback to Makefile.
				local mf = fn.findfile("build/Makefile", ".;")
				if mf ~= "" then return mf end
				mf = fn.findfile("Makefile", ".;")
				if mf ~= "" then return mf end
				return nil
			end

			local function run_in_floaterm(title, cmd)
				-- run the given shell command in Floaterm (plugin). shell-escape the whole cmd.
				local flo_cmd = "FloatermNew --autoclose=0 --title=" .. title .. " sh -c " .. fn.shellescape(cmd)
				vim.cmd(flo_cmd)
			end

			local function run_current_file()
				local ft = vim.bo.filetype
				local file = fn.expand("%")
				if file == "" then
					print("No file to run")
					return
				end
				local name = fn.expand("%:r")
				local file_esc = fn.shellescape(file)
				local name_esc = fn.shellescape(name)

				local mf = find_makefile()
				if mf then
					local mdir = fn.fnamemodify(mf, ":h")
					local mdir_esc = fn.shellescape(mdir)
					-- run make in that directory; keep target 'run' (you can change)
					run_in_floaterm("make", "make -s -C " .. mdir_esc .. " run")
					return
				end

				if ft == "c" then
					local cmd = string.format("gcc %s -o %s $(sdl2-config --cflags --libs) && ./%s", file_esc, name_esc,
						name_esc)
					run_in_floaterm("cc", cmd)
				elseif ft == "cpp" then
					local cmd = string.format("g++ %s -o %s && ./%s", file_esc, name_esc, name_esc)
					run_in_floaterm("cpp", cmd)
				elseif ft == "python" then
					run_in_floaterm("python", "python3 " .. file_esc)
				elseif ft == "java" then
					-- simple: compile then run by class name (works for single-file small programs)
					local cmd = string.format("javac %s && java %s", file_esc, name_esc)
					run_in_floaterm("java", cmd)
				elseif ft == "lua" then
					run_in_floaterm("lua", "lua " .. file_esc)
				elseif ft == "javascript" then
					run_in_floaterm("javascript-node", "node " .. file_esc)
				elseif ft == "rust" then
					-- try cargo run if Cargo.toml reachable
					local cargo = fn.findfile("Cargo.toml", ".;")
					if cargo ~= "" then
						local cargo_root = fn.fnamemodify(cargo, ":h")
						run_in_floaterm("cargo",
							"make -C " ..
							fn.shellescape(cargo_root) ..
							" run || (cd " .. fn.shellescape(cargo_root) .. " && cargo run)")
					else
						-- rustc fallback
						local out = "/tmp/" .. name
						run_in_floaterm("rust",
							string.format("rustc %s -o %s && %s", file_esc, fn.shellescape(out), fn.shellescape(out)))
					end
				else
					print("No runner for filetype: " .. ft)
				end
			end

			-- mappings: <C-Space> and double-space in normal mode
			vim.keymap.set("n", "<C-Space>", run_current_file, { desc = "Run current file or make" })
			vim.keymap.set("n", "  ", run_current_file, { desc = "Run current file or make" })
		end
	},
}

