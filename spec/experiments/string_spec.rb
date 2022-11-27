require 'spec_helper'

describe String do
  # エイリアスはconcat method
  # https://docs.ruby-lang.org/ja/latest/method/String/i/=3c=3c.html
  describe "#<<" do
    example "文字の追加" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end

    example "ASCIIコードを追加" do
      s = "ABC"
      # Dのコードは68 http://www3.nit.ac.jp/~tamura/ex2/ascii.html
      s << 68
      expect(s).to eq("ABCD")
    end

    example "nilは追加できない", :exception do
      s = "ABC"
      expect { s << nil }.to raise_error(TypeError)
    end
  end
end