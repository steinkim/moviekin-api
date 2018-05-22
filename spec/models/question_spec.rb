require 'rails_helper'

describe Question do
  before { @question = FactoryBot.build(:question) }
  subject { @question }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :content }

  it { should have_many(:answers) }

  describe "#answers association" do

    before do
      @question.save
      3.times { FactoryBot.create :answer, question: @question }
    end

    it "destroys the associated answers on self destruct" do
      answers = @question.answers
      @question.destroy
      answers.each do |answer|
        expect(Answer.find(answer)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end