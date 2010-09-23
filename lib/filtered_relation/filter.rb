require 'filtered_relation/related_query_methods'
ActiveRecord::Base.send :include, RelatedQueryMethods

module FilteredRelation

  class ::ActiveRecord::Base

    def self.filtered_relation(params) 
      relation = scoped 

      params.each do |facet, value| 
        relation = send("filter_by_#{facet}", value, relation) 
      end
      relation
    end

    def self.related_to(params) 
      relation = scoped 

      params.each do |facet, value| 
        relation = send("filter_by_related", facet, value, relation) 
      end
      relation
    end

    def self.date_between(params) 
      relation = scoped 
      relation = send("filter_by_date_between", params, relation) 
      relation
    end


  end

end
