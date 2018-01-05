require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DiariesHelper. For example:
#
# describe DiariesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DiariesHelper, type: :helper do
  describe "#markdown" do
    it do
      expect(markdown("# よかったこと")).to eq("<h1>よかったこと</h1>\n")
    end
  end

  describe "#restrictable" do
    subject { restrictable(diary) }
    let(:user) { nil }

    helper do
      def user_signed_in?
        user.present?
      end
    end

    context "ログインしていない場合" do
      context "secret な内容を含まないとき" do
        let(:diary) { "ここだけの話なのですが独身です。" }

        it do
          is_expected.to     include("独身です。")
          is_expected.to_not include("ここから先はチャンネル登録者のみ閲覧可能です。")
        end
      end

      context "secret な内容を含むとき" do
        let(:diary) { "ここだけの話なのですが<secret>独身です。</secret>" }

        it do
          is_expected.to     include("ここから先はチャンネル登録者のみ閲覧可能です。")
          is_expected.to_not include("独身です。")
        end
      end
    end

    context "ログインしている場合" do
      let(:user) { true }

      context "secret な内容を含むとき" do
        let(:diary) { "ここだけの話なのですが<secret>独身です。</secret>" }

        it do
          is_expected.to     include("独身です。")
          is_expected.to_not include("ここから先はチャンネル登録者のみ閲覧可能です。")
        end
      end
    end
  end
end
