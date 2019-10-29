require './lib/api/text_speech.rb'

class TexttospeechController < ApplicationController

  def create
    # watson = Watson.new
    synthesized_audio = Watson.create_synthesized_audio
    data = "Hello World!"
    send_data(synthesized_audio, :filename => "hi.wav")
  end

end
