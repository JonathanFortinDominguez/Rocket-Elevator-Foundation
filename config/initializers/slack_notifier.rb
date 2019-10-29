module SlackNotifier
    CLIENT = Slack::Notifier.new ENV['SLACK_HTTP']
  end