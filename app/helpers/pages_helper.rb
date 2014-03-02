module PagesHelper
  def programing_languages
    %w{ HTML CSS JS XML Ruby Python PHP MySQL AS2 AS3}.map do |p|
      OpenStruct.new({name: p})
    end
  end

  def development_frameworks
   ["Ruby on Rails","Angularjs","Sinatra","Nodejs","Flex"].map do |p|
      OpenStruct.new({name: p,slug: p.parameterize})
    end
  end

  def design_software
    %w{Flash Illustrator Photoshop AfterEffects Fireworks DreamWeaver}.map do |s|
      OpenStruct.new({name:s})
    end
  end
end
