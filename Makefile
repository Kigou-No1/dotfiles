install:
	chmod +x ./install.sh
	./install.sh

Iinstall:
	chmod +x ./Interactive-install.sh
	./Interactive-install.sh

deploy:
	chmod +x ./deploy.sh
	./bin/symlink.sh

app:
	chmod +x ./bin/brew.sh
	chmod +x ./bin/misc-softwares.sh
	./bin/brew.sh
	./bin/misc-softwares.sh

setup-git:
	chmod +x ./bin/setup-git.sh
	./bin/setup-git.sh
