-- 🎨 Icon Support for LSP and completion 🎨
-- 🚀 Maximum Icons & Emojis Configuration 🚀
return {
  -- 🎯 Main icon provider with TONS of icons 🎯
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        default = true,
        strict = true,
        override_by_filename = {
          -- 📁 Configuration Files 📁
          ['.gitignore'] = { icon = '🙈', color = '#f1502f', name = 'Gitignore' },
          ['.gitattributes'] = { icon = '📋', color = '#f1502f', name = 'GitAttributes' },
          ['.gitmodules'] = { icon = '📦', color = '#f1502f', name = 'GitModules' },
          ['README.md'] = { icon = '📖', color = '#519aba', name = 'Readme' },
          ['README.txt'] = { icon = '📄', color = '#519aba', name = 'Readme' },
          ['LICENSE'] = { icon = '⚖️', color = '#cbcb41', name = 'License' },
          ['CHANGELOG.md'] = { icon = '📝', color = '#8cc8ff', name = 'Changelog' },
          ['CONTRIBUTING.md'] = { icon = '🤝', color = '#ff6b6b', name = 'Contributing' },
          ['CODE_OF_CONDUCT.md'] = { icon = '📜', color = '#ff9f43', name = 'CodeOfConduct' },
          
          -- 🛠️ Build & Config Files 🛠️
          ['Makefile'] = { icon = '🔨', color = '#427819', name = 'Makefile' },
          ['CMakeLists.txt'] = { icon = '🏗️', color = '#427819', name = 'CMake' },
          ['Dockerfile'] = { icon = '🐳', color = '#0db7ed', name = 'Docker' },
          ['docker-compose.yml'] = { icon = '🐙', color = '#0db7ed', name = 'DockerCompose' },
          ['docker-compose.yaml'] = { icon = '🐙', color = '#0db7ed', name = 'DockerCompose' },
          ['.dockerignore'] = { icon = '🐳', color = '#0db7ed', name = 'DockerIgnore' },
          ['package.json'] = { icon = '📦', color = '#e8274b', name = 'PackageJson' },
          ['package-lock.json'] = { icon = '🔒', color = '#e8274b', name = 'PackageLock' },
          ['yarn.lock'] = { icon = '🧶', color = '#2c8ebb', name = 'YarnLock' },
          ['composer.json'] = { icon = '🎼', color = '#885630', name = 'Composer' },
          ['Cargo.toml'] = { icon = '📦', color = '#dea584', name = 'Cargo' },
          ['Cargo.lock'] = { icon = '🔒', color = '#dea584', name = 'CargoLock' },
          ['pyproject.toml'] = { icon = '🐍', color = '#3776ab', name = 'PyProject' },
          ['requirements.txt'] = { icon = '📋', color = '#3776ab', name = 'Requirements' },
          ['setup.py'] = { icon = '⚙️', color = '#3776ab', name = 'Setup' },
          ['setup.cfg'] = { icon = '⚙️', color = '#3776ab', name = 'SetupCfg' },
          ['pom.xml'] = { icon = '☕', color = '#ed8b00', name = 'Maven' },
          ['build.gradle'] = { icon = '🐘', color = '#02303a', name = 'Gradle' },
          ['build.gradle.kts'] = { icon = '🐘', color = '#02303a', name = 'GradleKts' },
          
          -- 🌐 Web & Frontend 🌐
          ['index.html'] = { icon = '🏠', color = '#e34c26', name = 'IndexHtml' },
          ['.htaccess'] = { icon = '🔐', color = '#d73502', name = 'Htaccess' },
          ['robots.txt'] = { icon = '🤖', color = '#8cc8ff', name = 'Robots' },
          ['sitemap.xml'] = { icon = '🗺️', color = '#8cc8ff', name = 'Sitemap' },
          ['favicon.ico'] = { icon = '🌟', color = '#cbcb41', name = 'Favicon' },
          ['manifest.json'] = { icon = '📱', color = '#ff6b6b', name = 'Manifest' },
          ['service-worker.js'] = { icon = '⚙️', color = '#f1dd35', name = 'ServiceWorker' },
          
          -- 📊 Data & Database 📊
          ['database.db'] = { icon = '🗄️', color = '#dad8d8', name = 'Database' },
          ['database.sqlite'] = { icon = '🗄️', color = '#dad8d8', name = 'SQLite' },
          ['database.sql'] = { icon = '🗄️', color = '#dad8d8', name = 'SQL' },
          ['data.json'] = { icon = '📊', color = '#cbcb41', name = 'DataJson' },
          ['data.csv'] = { icon = '📈', color = '#89e051', name = 'CSV' },
          ['data.xml'] = { icon = '📋', color = '#e37933', name = 'XML' },
          ['data.yaml'] = { icon = '📝', color = '#ff6b6b', name = 'YAML' },
          ['data.yml'] = { icon = '📝', color = '#ff6b6b', name = 'YML' },
          
          -- 🎨 Design & Media 🎨
          ['design.sketch'] = { icon = '🎨', color = '#f7b93e', name = 'Sketch' },
          ['design.fig'] = { icon = '🎨', color = '#f24e1e', name = 'Figma' },
          ['design.psd'] = { icon = '🖼️', color = '#31a8ff', name = 'Photoshop' },
          ['design.ai'] = { icon = '🎨', color = '#ff9a00', name = 'Illustrator' },
          ['design.xd'] = { icon = '🎨', color = '#ff61f6', name = 'AdobeXD' },
          
          -- 🔧 System & Admin 🔧
          ['.env'] = { icon = '🔒', color = '#faf047', name = 'Env' },
          ['.env.local'] = { icon = '🔒', color = '#faf047', name = 'EnvLocal' },
          ['.env.development'] = { icon = '🔒', color = '#faf047', name = 'EnvDev' },
          ['.env.production'] = { icon = '🔒', color = '#faf047', name = 'EnvProd' },
          ['.bashrc'] = { icon = '🐚', color = '#89e051', name = 'Bashrc' },
          ['.bash_profile'] = { icon = '🐚', color = '#89e051', name = 'BashProfile' },
          ['.zshrc'] = { icon = '🐚', color = '#89e051', name = 'Zshrc' },
          ['.vimrc'] = { icon = '💚', color = '#019833', name = 'Vimrc' },
          ['init.vim'] = { icon = '💚', color = '#019833', name = 'InitVim' },
          ['init.lua'] = { icon = '🌙', color = '#51a0cf', name = 'InitLua' },
          ['.tmux.conf'] = { icon = '🖥️', color = '#1bb91f', name = 'Tmux' },
          ['.ssh/config'] = { icon = '🔐', color = '#ff6b6b', name = 'SshConfig' },
          
          -- 🧪 Testing 🧪
          ['test.js'] = { icon = '🧪', color = '#f1dd35', name = 'TestJs' },
          ['test.py'] = { icon = '🧪', color = '#3776ab', name = 'TestPy' },
          ['test.rb'] = { icon = '🧪', color = '#701516', name = 'TestRb' },
          ['test.go'] = { icon = '🧪', color = '#00add8', name = 'TestGo' },
          ['spec.js'] = { icon = '🔬', color = '#f1dd35', name = 'SpecJs' },
          ['spec.rb'] = { icon = '🔬', color = '#701516', name = 'SpecRb' },
          
          -- 📚 Documentation 📚
          ['INSTALL.md'] = { icon = '📥', color = '#519aba', name = 'Install' },
          ['UPGRADE.md'] = { icon = '⬆️', color = '#519aba', name = 'Upgrade' },
          ['API.md'] = { icon = '🔌', color = '#519aba', name = 'API' },
          ['SECURITY.md'] = { icon = '🛡️', color = '#519aba', name = 'Security' },
          ['TROUBLESHOOTING.md'] = { icon = '🔧', color = '#519aba', name = 'Troubleshooting' },
          ['FAQ.md'] = { icon = '❓', color = '#519aba', name = 'FAQ' },
          ['EXAMPLES.md'] = { icon = '💡', color = '#519aba', name = 'Examples' },
          
          -- 🎯 Special Files 🎯
          ['TODO.md'] = { icon = '✅', color = '#ff6b6b', name = 'Todo' },
          ['NOTES.md'] = { icon = '📝', color = '#ff9f43', name = 'Notes' },
          ['DIARY.md'] = { icon = '📔', color = '#ff6b6b', name = 'Diary' },
          ['JOURNAL.md'] = { icon = '📓', color = '#ff6b6b', name = 'Journal' },
          ['BOOKMARK.md'] = { icon = '🔖', color = '#ff9f43', name = 'Bookmark' },
          ['LINKS.md'] = { icon = '🔗', color = '#519aba', name = 'Links' },
          ['RESOURCES.md'] = { icon = '📚', color = '#519aba', name = 'Resources' },
        },
        override_by_extension = {
          -- 🐍 Python Files 🐍
          ['py'] = { icon = '🐍', color = '#3776ab', name = 'Python' },
          ['pyx'] = { icon = '🐍', color = '#3776ab', name = 'Cython' },
          ['pyi'] = { icon = '🐍', color = '#3776ab', name = 'PythonInterface' },
          ['pyc'] = { icon = '🐍', color = '#3776ab', name = 'PythonCompiled' },
          ['pyd'] = { icon = '🐍', color = '#3776ab', name = 'PythonDll' },
          ['pyo'] = { icon = '🐍', color = '#3776ab', name = 'PythonOptimized' },
          ['pyw'] = { icon = '🐍', color = '#3776ab', name = 'PythonWindows' },
          
          -- 🌐 JavaScript & TypeScript 🌐
          ['js'] = { icon = '🟨', color = '#f1dd35', name = 'JavaScript' },
          ['jsx'] = { icon = '⚛️', color = '#61dafb', name = 'React' },
          ['ts'] = { icon = '🔷', color = '#3178c6', name = 'TypeScript' },
          ['tsx'] = { icon = '⚛️', color = '#61dafb', name = 'ReactTypeScript' },
          ['mjs'] = { icon = '🟨', color = '#f1dd35', name = 'ModuleJS' },
          ['cjs'] = { icon = '🟨', color = '#f1dd35', name = 'CommonJS' },
          
          -- 🌙 Lua Files 🌙
          ['lua'] = { icon = '🌙', color = '#51a0cf', name = 'Lua' },
          ['luac'] = { icon = '🌙', color = '#51a0cf', name = 'LuaCompiled' },
          
          -- 🦀 Rust Files 🦀
          ['rs'] = { icon = '🦀', color = '#dea584', name = 'Rust' },
          ['rlib'] = { icon = '🦀', color = '#dea584', name = 'RustLib' },
          
          -- 🐹 Go Files 🐹
          ['go'] = { icon = '🐹', color = '#00add8', name = 'Go' },
          ['mod'] = { icon = '🐹', color = '#00add8', name = 'GoMod' },
          ['sum'] = { icon = '🐹', color = '#00add8', name = 'GoSum' },
          
          -- 💎 Ruby Files 💎
          ['rb'] = { icon = '💎', color = '#701516', name = 'Ruby' },
          ['ru'] = { icon = '💎', color = '#701516', name = 'Ruby' },
          ['erb'] = { icon = '💎', color = '#701516', name = 'ERB' },
          ['gemspec'] = { icon = '💎', color = '#701516', name = 'Gemspec' },
          
          -- ☕ Java Files ☕
          ['java'] = { icon = '☕', color = '#ed8b00', name = 'Java' },
          ['jar'] = { icon = '☕', color = '#ed8b00', name = 'Jar' },
          ['war'] = { icon = '☕', color = '#ed8b00', name = 'War' },
          ['ear'] = { icon = '☕', color = '#ed8b00', name = 'Ear' },
          ['class'] = { icon = '☕', color = '#ed8b00', name = 'JavaClass' },
          
          -- 🎭 Kotlin Files 🎭
          ['kt'] = { icon = '🎭', color = '#7f52ff', name = 'Kotlin' },
          ['kts'] = { icon = '🎭', color = '#7f52ff', name = 'KotlinScript' },
          
          -- 💜 C# Files 💜
          ['cs'] = { icon = '💜', color = '#239120', name = 'CSharp' },
          ['csx'] = { icon = '💜', color = '#239120', name = 'CSharpScript' },
          ['csproj'] = { icon = '💜', color = '#239120', name = 'CSharpProject' },
          ['sln'] = { icon = '💜', color = '#239120', name = 'Solution' },
          
          -- 🔧 C/C++ Files 🔧
          ['c'] = { icon = '🔧', color = '#555555', name = 'C' },
          ['cc'] = { icon = '🔧', color = '#f34b7d', name = 'CPlusPlus' },
          ['cpp'] = { icon = '🔧', color = '#f34b7d', name = 'CPlusPlus' },
          ['cxx'] = { icon = '🔧', color = '#f34b7d', name = 'CPlusPlus' },
          ['c++'] = { icon = '🔧', color = '#f34b7d', name = 'CPlusPlus' },
          ['h'] = { icon = '🔧', color = '#555555', name = 'Header' },
          ['hh'] = { icon = '🔧', color = '#f34b7d', name = 'HeaderPlusPlus' },
          ['hpp'] = { icon = '🔧', color = '#f34b7d', name = 'HeaderPlusPlus' },
          ['hxx'] = { icon = '🔧', color = '#f34b7d', name = 'HeaderPlusPlus' },
          ['h++'] = { icon = '🔧', color = '#f34b7d', name = 'HeaderPlusPlus' },
          
          -- 🐘 PHP Files 🐘
          ['php'] = { icon = '🐘', color = '#4f5d95', name = 'PHP' },
          ['phtml'] = { icon = '🐘', color = '#4f5d95', name = 'PHTML' },
          ['php3'] = { icon = '🐘', color = '#4f5d95', name = 'PHP3' },
          ['php4'] = { icon = '🐘', color = '#4f5d95', name = 'PHP4' },
          ['php5'] = { icon = '🐘', color = '#4f5d95', name = 'PHP5' },
          ['phps'] = { icon = '🐘', color = '#4f5d95', name = 'PHPS' },
          
          -- 🌈 Shell Scripts 🌈
          ['sh'] = { icon = '🐚', color = '#89e051', name = 'Shell' },
          ['bash'] = { icon = '🐚', color = '#89e051', name = 'Bash' },
          ['zsh'] = { icon = '🐚', color = '#89e051', name = 'Zsh' },
          ['fish'] = { icon = '🐠', color = '#4aae47', name = 'Fish' },
          ['ksh'] = { icon = '🐚', color = '#89e051', name = 'Ksh' },
          ['csh'] = { icon = '🐚', color = '#89e051', name = 'Csh' },
          ['tcsh'] = { icon = '🐚', color = '#89e051', name = 'Tcsh' },
          
          -- 🌍 Web Files 🌍
          ['html'] = { icon = '🌍', color = '#e34c26', name = 'HTML' },
          ['htm'] = { icon = '🌍', color = '#e34c26', name = 'HTM' },
          ['xhtml'] = { icon = '🌍', color = '#e34c26', name = 'XHTML' },
          ['shtml'] = { icon = '🌍', color = '#e34c26', name = 'SHTML' },
          ['css'] = { icon = '🎨', color = '#563d7c', name = 'CSS' },
          ['scss'] = { icon = '🎨', color = '#c6538c', name = 'SCSS' },
          ['sass'] = { icon = '🎨', color = '#a53b70', name = 'Sass' },
          ['less'] = { icon = '🎨', color = '#1d365d', name = 'Less' },
          ['styl'] = { icon = '🎨', color = '#ff6347', name = 'Stylus' },
          
          -- 📝 Markup & Text 📝
          ['md'] = { icon = '📝', color = '#083fa1', name = 'Markdown' },
          ['markdown'] = { icon = '📝', color = '#083fa1', name = 'Markdown' },
          ['rst'] = { icon = '📝', color = '#141414', name = 'ReStructuredText' },
          ['tex'] = { icon = '📄', color = '#3d6117', name = 'LaTeX' },
          ['latex'] = { icon = '📄', color = '#3d6117', name = 'LaTeX' },
          ['txt'] = { icon = '📄', color = '#89e051', name = 'Text' },
          ['rtf'] = { icon = '📄', color = '#89e051', name = 'RTF' },
          ['org'] = { icon = '📝', color = '#77aa99', name = 'Org' },
          
          -- 📊 Data Files 📊
          ['json'] = { icon = '📊', color = '#cbcb41', name = 'JSON' },
          ['jsonc'] = { icon = '📊', color = '#cbcb41', name = 'JSONC' },
          ['json5'] = { icon = '📊', color = '#cbcb41', name = 'JSON5' },
          ['yaml'] = { icon = '📋', color = '#ff6b6b', name = 'YAML' },
          ['yml'] = { icon = '📋', color = '#ff6b6b', name = 'YML' },
          ['toml'] = { icon = '📋', color = '#9c4221', name = 'TOML' },
          ['ini'] = { icon = '⚙️', color = '#6d8086', name = 'INI' },
          ['cfg'] = { icon = '⚙️', color = '#6d8086', name = 'Config' },
          ['conf'] = { icon = '⚙️', color = '#6d8086', name = 'Config' },
          ['config'] = { icon = '⚙️', color = '#6d8086', name = 'Config' },
          ['xml'] = { icon = '📋', color = '#e37933', name = 'XML' },
          ['plist'] = { icon = '📋', color = '#e37933', name = 'Plist' },
          ['csv'] = { icon = '📈', color = '#89e051', name = 'CSV' },
          ['tsv'] = { icon = '📈', color = '#89e051', name = 'TSV' },
          
          -- 🗄️ Database Files 🗄️
          ['sql'] = { icon = '🗄️', color = '#dad8d8', name = 'SQL' },
          ['db'] = { icon = '🗄️', color = '#dad8d8', name = 'Database' },
          ['sqlite'] = { icon = '🗄️', color = '#dad8d8', name = 'SQLite' },
          ['sqlite3'] = { icon = '🗄️', color = '#dad8d8', name = 'SQLite3' },
          
          -- 🖼️ Image Files 🖼️
          ['png'] = { icon = '🖼️', color = '#a074c4', name = 'PNG' },
          ['jpg'] = { icon = '🖼️', color = '#a074c4', name = 'JPEG' },
          ['jpeg'] = { icon = '🖼️', color = '#a074c4', name = 'JPEG' },
          ['gif'] = { icon = '🖼️', color = '#a074c4', name = 'GIF' },
          ['bmp'] = { icon = '🖼️', color = '#a074c4', name = 'BMP' },
          ['tiff'] = { icon = '🖼️', color = '#a074c4', name = 'TIFF' },
          ['tif'] = { icon = '🖼️', color = '#a074c4', name = 'TIF' },
          ['webp'] = { icon = '🖼️', color = '#a074c4', name = 'WebP' },
          ['svg'] = { icon = '🎨', color = '#ffb13b', name = 'SVG' },
          ['ico'] = { icon = '🌟', color = '#cbcb41', name = 'Icon' },
          ['icns'] = { icon = '🌟', color = '#cbcb41', name = 'ICNS' },
          
          -- 🎵 Audio Files 🎵
          ['mp3'] = { icon = '🎵', color = '#00d9ff', name = 'MP3' },
          ['wav'] = { icon = '🎵', color = '#00d9ff', name = 'WAV' },
          ['flac'] = { icon = '🎵', color = '#00d9ff', name = 'FLAC' },
          ['aac'] = { icon = '🎵', color = '#00d9ff', name = 'AAC' },
          ['ogg'] = { icon = '🎵', color = '#00d9ff', name = 'OGG' },
          ['wma'] = { icon = '🎵', color = '#00d9ff', name = 'WMA' },
          ['m4a'] = { icon = '🎵', color = '#00d9ff', name = 'M4A' },
          
          -- 🎬 Video Files 🎬
          ['mp4'] = { icon = '🎬', color = '#fd971f', name = 'MP4' },
          ['avi'] = { icon = '🎬', color = '#fd971f', name = 'AVI' },
          ['mov'] = { icon = '🎬', color = '#fd971f', name = 'MOV' },
          ['wmv'] = { icon = '🎬', color = '#fd971f', name = 'WMV' },
          ['flv'] = { icon = '🎬', color = '#fd971f', name = 'FLV' },
          ['webm'] = { icon = '🎬', color = '#fd971f', name = 'WebM' },
          ['mkv'] = { icon = '🎬', color = '#fd971f', name = 'MKV' },
          ['m4v'] = { icon = '🎬', color = '#fd971f', name = 'M4V' },
          
          -- 📚 Document Files 📚
          ['pdf'] = { icon = '📕', color = '#b30b00', name = 'PDF' },
          ['doc'] = { icon = '📘', color = '#2b579a', name = 'Word' },
          ['docx'] = { icon = '📘', color = '#2b579a', name = 'WordX' },
          ['xls'] = { icon = '📗', color = '#207245', name = 'Excel' },
          ['xlsx'] = { icon = '📗', color = '#207245', name = 'ExcelX' },
          ['ppt'] = { icon = '📙', color = '#d24726', name = 'PowerPoint' },
          ['pptx'] = { icon = '📙', color = '#d24726', name = 'PowerPointX' },
          ['odt'] = { icon = '📄', color = '#0f1419', name = 'ODT' },
          ['ods'] = { icon = '📄', color = '#0f1419', name = 'ODS' },
          ['odp'] = { icon = '📄', color = '#0f1419', name = 'ODP' },
          
          -- 📦 Archive Files 📦
          ['zip'] = { icon = '📦', color = '#f9c513', name = 'Zip' },
          ['rar'] = { icon = '📦', color = '#f9c513', name = 'RAR' },
          ['7z'] = { icon = '📦', color = '#f9c513', name = '7Zip' },
          ['tar'] = { icon = '📦', color = '#f9c513', name = 'Tar' },
          ['gz'] = { icon = '📦', color = '#f9c513', name = 'Gzip' },
          ['bz2'] = { icon = '📦', color = '#f9c513', name = 'Bzip2' },
          ['xz'] = { icon = '📦', color = '#f9c513', name = 'XZ' },
          ['tar.gz'] = { icon = '📦', color = '#f9c513', name = 'TarGz' },
          ['tar.bz2'] = { icon = '📦', color = '#f9c513', name = 'TarBz2' },
          ['tar.xz'] = { icon = '📦', color = '#f9c513', name = 'TarXz' },
          
          -- 🔑 Security Files 🔑
          ['key'] = { icon = '🔑', color = '#ffb13b', name = 'Key' },
          ['pem'] = { icon = '🔑', color = '#ffb13b', name = 'PEM' },
          ['crt'] = { icon = '🔑', color = '#ffb13b', name = 'Certificate' },
          ['cert'] = { icon = '🔑', color = '#ffb13b', name = 'Certificate' },
          ['p12'] = { icon = '🔑', color = '#ffb13b', name = 'P12' },
          ['pfx'] = { icon = '🔑', color = '#ffb13b', name = 'PFX' },
          ['gpg'] = { icon = '🔐', color = '#ffb13b', name = 'GPG' },
          ['asc'] = { icon = '🔐', color = '#ffb13b', name = 'ASCII' },
          
          -- ⚡ Special Extensions ⚡
          ['log'] = { icon = '📜', color = '#afbf7e', name = 'Log' },
          ['lock'] = { icon = '🔒', color = '#bbbbbb', name = 'Lock' },
          ['tmp'] = { icon = '🗑️', color = '#6d8086', name = 'Temp' },
          ['bak'] = { icon = '🔄', color = '#6d8086', name = 'Backup' },
          ['old'] = { icon = '🕰️', color = '#6d8086', name = 'Old' },
          ['orig'] = { icon = '🔄', color = '#6d8086', name = 'Original' },
          ['swp'] = { icon = '💾', color = '#6d8086', name = 'Swap' },
          ['swo'] = { icon = '💾', color = '#6d8086', name = 'Swap' },
          ['pid'] = { icon = '🔢', color = '#6d8086', name = 'PID' },
          ['sock'] = { icon = '🔌', color = '#6d8086', name = 'Socket' },
          
          -- 🚀 Deployment Files 🚀
          ['dockerfile'] = { icon = '🐳', color = '#0db7ed', name = 'Dockerfile' },
          ['dockerignore'] = { icon = '🐳', color = '#0db7ed', name = 'DockerIgnore' },
          ['jenkinsfile'] = { icon = '🤖', color = '#d33833', name = 'Jenkins' },
          ['travis'] = { icon = '🟢', color = '#78b900', name = 'Travis' },
          ['appveyor'] = { icon = '🔵', color = '#00b3e0', name = 'AppVeyor' },
          ['gitlab-ci'] = { icon = '🦊', color = '#e24329', name = 'GitLabCI' },
          ['github'] = { icon = '🐱', color = '#24292e', name = 'GitHub' },
          ['bitbucket'] = { icon = '🪣', color = '#0052cc', name = 'Bitbucket' },
          
          -- 🌟 Framework Specific 🌟
          ['vue'] = { icon = '💚', color = '#4fc08d', name = 'Vue' },
          ['svelte'] = { icon = '🧡', color = '#ff3e00', name = 'Svelte' },
          ['angular'] = { icon = '🅰️', color = '#dd0031', name = 'Angular' },
          ['react'] = { icon = '⚛️', color = '#61dafb', name = 'React' },
          ['next'] = { icon = '▲', color = '#000000', name = 'Next' },
          ['nuxt'] = { icon = '💚', color = '#00c58e', name = 'Nuxt' },
          ['gatsby'] = { icon = '🚀', color = '#663399', name = 'Gatsby' },
          ['ember'] = { icon = '🔥', color = '#e04e39', name = 'Ember' },
          ['backbone'] = { icon = '🦴', color = '#0071b5', name = 'Backbone' },
          ['jquery'] = { icon = '💎', color = '#0769ad', name = 'jQuery' },
          
          -- 🎯 More Extensions 🎯
          ['vim'] = { icon = '💚', color = '#019833', name = 'Vim' },
          ['vimrc'] = { icon = '💚', color = '#019833', name = 'Vimrc' },
          ['nvim'] = { icon = '💚', color = '#019833', name = 'Neovim' },
          ['tmux'] = { icon = '🖥️', color = '#1bb91f', name = 'Tmux' },
          ['zsh'] = { icon = '🐚', color = '#89e051', name = 'Zsh' },
          ['bash'] = { icon = '🐚', color = '#89e051', name = 'Bash' },
          ['fish'] = { icon = '🐠', color = '#4aae47', name = 'Fish' },
          ['powershell'] = { icon = '💙', color = '#012456', name = 'PowerShell' },
          ['bat'] = { icon = '🦇', color = '#c1f12e', name = 'Batch' },
          ['cmd'] = { icon = '💻', color = '#4d4d4d', name = 'Command' },
          ['ps1'] = { icon = '💙', color = '#012456', name = 'PowerShell' },
          ['psm1'] = { icon = '💙', color = '#012456', name = 'PowerShellModule' },
        },
      })
    end
  },
  
  -- 🎉 Additional Icon Plugins 🎉
  {
    'onsails/lspkind.nvim',
    event = { "InsertEnter" },
    opts = {
      -- 🎯 LSP Kind Icons 🎯
      mode = 'symbol_text',
      preset = 'codicons',
      symbol_map = {
        Text = "📝",
        Method = "🔧",
        Function = "⚡",
        Constructor = "🏗️",
        Field = "🌾",
        Variable = "📦",
        Class = "🏛️",
        Interface = "🔌",
        Module = "📚",
        Property = "🔑",
        Unit = "📏",
        Value = "💎",
        Enum = "🎯",
        Keyword = "🗝️",
        Snippet = "✂️",
        Color = "🎨",
        File = "📄",
        Reference = "🔗",
        Folder = "📁",
        EnumMember = "🎯",
        Constant = "🚀",
        Struct = "🧱",
        Event = "⚡",
        Operator = "➕",
        TypeParameter = "🔤",
        Copilot = "🤖",
      },
    },
    config = function(_, opts)
      require('lspkind').init(opts)
    end
  }
}
