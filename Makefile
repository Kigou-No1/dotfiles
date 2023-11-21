install:
	./install.sh

Iinstall:
	./Interactive-install.sh

deploy:
	./bin/symlink.sh

app:
	./bin/brew.sh
	./bin/misc-softwares.sh

app-extra:
	.bin/brew.sh
	./bin/misc-softwares.sh
	./bin/extra-softwares.sh

setup-git:
	./bin/setup-git.sh
