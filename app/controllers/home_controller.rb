require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class HomeController < ApplicationController
  def index
  end
  def mrss
  	begin
      content = ""
      content = IO.read(params['mrss_url'])
      @data =  Hash.from_xml(content)
      puts @data.inspect
    rescue Exception => e
     raise "Unable to read the file: #{e.message}"
    end
  end

  def mrss_media
  	begin
      content = ""
      content = IO.read(params['mrss_media_url'])
      @data =  Hash.from_xml(content)
      puts @data.inspect
    rescue Exception => e
      raise "Unable to read the file: #{e.message}"
    end
  end
  
  def itunes
    begin
      content = ""
      content = IO.read(params['itunes_url'])
      @data =  Hash.from_xml(content)
      puts @data.inspect
    rescue Exception => e
     raise "Unable to read the file: #{e.message}"
    end
  end

  def divx
    begin
      content = ""
      content = IO.read('divx.xml')
      @data =  Hash.from_xml(content)
    rescue Exception => e
     raise "Unable to read the file: #{e.message}"
    end
  end

  def live_sample
  	begin
      content = ""
      open(params['live_url']) do |s| content = s.read end
      File.open('test2.xml', 'w') do |f2|
        f2.puts content
      end
      @data =  Hash.from_xml(content)
      puts @data.inspect
    rescue Exception => e
     raise "Unable to read the file: #{e.message}"
    end


   
  end
end