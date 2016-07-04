# controller for main form
class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text]
    @words = @text.split(' ')
    @word_count = @words.length
    @word_frequency = {}
    @minutes = @word_count.to_f / 275

    @words.each do |word|
      if !@word_frequency[word.downcase]
        @word_frequency[word.downcase] = 1
      else
        @word_frequency[word.downcase] = @word_frequency[word.downcase] + 1
      end
    end

    @sorted = @word_frequency.sort_by { |k , v| v}

    @top_ten = @sorted.reverse[0..9]

    render 'results'
  end
end
