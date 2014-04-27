require 'spec_helper'

describe 'all_parents' do
   it { expect(subject.call([''])).to eq([]) }
   it { expect(subject.call(['/'])).to eq([]) }
   it { expect(subject.call(['/path'])).to eq([]) }
   it { expect(subject.call(['/path/to'])).to eq(['/path']) }
   it { expect(subject.call(['relpath'])).to eq([]) }
   it { expect(subject.call(['relpath/to'])).to eq(['relpath']) }
   it { expect(subject.call(['./relpath'])).to eq([]) }
   it { expect(subject.call(['./relpath/to'])).to eq(['./relpath']) }

   it 'splits /path/to/myproject' do
      result = subject.call(['/path/to/myproject'])
      expect(result).to eq(['/path', '/path/to'])
   end

   it 'splits relpath/to/myproject' do
      result = subject.call(['relpath/to/myproject'])
      expect(result).to eq(['relpath', 'relpath/to'])
   end

   it 'splits ./relpath/to/myproject' do
      result = subject.call(['./relpath/to/myproject'])
      expect(result).to eq(['./relpath', './relpath/to'])
   end

end
