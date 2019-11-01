module SlackNotifier
    CLIENT = Slack::Notifier.new ENV['SLACK_HTTP']
end

# Use https://github.com/stevenosloan/slack-notifier to use this api