require './spec/spec_helper'
require './lib/modules/regex_slack'

describe RegexpSlack do
  describe '#get_values_from' do
    let(:text) { 'Hola <@LUC14AN>' }
    let(:fake_text) { 'Hola humano' }
    let(:dc) { DummyClass.new.extend(RegexpSlack) }

    context 'when match succeeds' do
      it { expect(dc.get_values_from(text).captures[0]).to eq("LUC14AN") }
    end

    context 'when match fails' do
      it { expect(dc.get_values_from(fake_text)).to be nil }
      it { expect(dc.get_values_from(fake_text).respond_to?(:captures)).to be false }
    end
  end

  describe '#echo' do
    let(:dc) { DummyClass.new.extend(RegexpSlack) }

    context 'when match succeeds' do
      it { expect(dc.echo('\echo #comunidad-seguridad un saludo')).to eq(['un saludo', '#comunidad-seguridad', nil]) }
      it { expect(dc.echo('\echo #comunidad-seguridad 1231 saludo')).to eq(['1231 saludo', '#comunidad-seguridad', nil]) }
      it { expect(dc.echo('\echo #comunidad-seguridad \!#as saludo')).to eq(['\!#as saludo', '#comunidad-seguridad', nil]) }
      it { expect(dc.echo('\echo <@LUC14AN|Lucio> un saludo')).to eq(['un saludo', 'LUC14AN', nil]) }
      it { expect(dc.echo('\echo LUC14AN un saludo')).to eq(['un saludo', 'LUC14AN', nil]) }
      it { expect(dc.echo('\echo CH4NN3L-1588015518.007300 un saludo')).to eq(['un saludo', 'CH4NN3L', '1588015518.007300']) }
    end

    context 'when match fails' do
      #it { expect(dc.echo('\echo #comunidad-seguridadun saludo')).to eq(['saludo', '#comunidad-seguridadun', nil]) }
    end
  end
end
