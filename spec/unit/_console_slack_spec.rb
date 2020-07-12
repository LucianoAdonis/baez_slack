require './spec/spec_helper'
require './lib/baez_slack'
require './lib/modules/console_slack'

describe ConsoleSlack do
  describe '#channel_properties' do
    let(:text) { 'RTest' }
    let(:slack) { BaezSlack.new.extend(ConsoleSlack) }
    let(:type) {  DummyClass.new.struct }

    context 'when login succeeds' do
      it { expect(slack.format_new_message(type)).to eq("CQZA6RJ2E") }
    end
  end
end
