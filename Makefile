VERSION_FILE := 0.0.9

deploy:
	gem build baez_slack.gemspec
	gem install ./baez_slack-$(VERSION_FILE).gem

push:
	gem push baez_slack-$(VERSION_FILE).gem

clean:
	gem uninstall baez_slack

test: clean deploy