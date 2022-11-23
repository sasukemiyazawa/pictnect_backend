module Common
    extend ActiveSupport::Concern

    def setTag(model, tags)
        if(!tags.nil?)
            model.tags = []
            Array(tags).each do |tag|
                model.tags << Tag.find_or_create_by(tagname: tag)
            end
        end
    end
  
  end