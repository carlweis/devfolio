require './lib/helpers/markdowner.rb'

class Api::MarkdownController < ApplicationController
  include Markdowner

  def convert
     markdown_input = params[:markdown]
     markdown_content = markdown_input == nil ? 'No markdown input' : markdown_input
     render :text => markdown_to_html(markdown_content)
  end
end
