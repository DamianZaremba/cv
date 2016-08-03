all: pdf html epub latex

pdf:
	pandoc README.md -o damianzaremba.pdf

html:
	pandoc README.md -o damianzaremba.html

epub:
	pandoc README.md -o damianzaremba.epub

latex:
	pandoc README.md -o damianzaremba.tex

push:
	# SSH wrapper
	if [ ! -d _temp ]; then \
		mkdir -p _temp; \
	fi

	if [ ! -f _temp/ssh ]; then \
		echo 'exec ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $$*' > _temp/ssh; \
		chmod 755 _temp/ssh; \
	fi

	if [ "`git ls-files --modified --deleted | wc -l`" != "0" ] && [ "master" = "$(TRAVIS_BRANCH)" ]; \
	then \
		git add --all . && \
			git commit -am "Formats auto updated"; \
				if [ -z "${GH_TOKEN}" ]; then \
					GIT_SSH=../_temp/ssh git push git@github.com:DamianZaremba/cv.git master; \
				else \
					git push "https://${GH_TOKEN}@github.com/DamianZaremba/cv.git" master &> /dev/null; \
				fi \
	fi

install: all push
