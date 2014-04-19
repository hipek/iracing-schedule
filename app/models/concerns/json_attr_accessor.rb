class JsonAttrAccessor
  def initialize(*list)
    @list = list
  end

  def module
    list = @list
    Module.new do
      list.each do |name|
        define_method :"#{name}=" do |val|
          val = (val || []).reject(&:blank?).map{|l| l.to_i}
          write_attribute(name.to_sym, val.to_json)
        end

        define_method :"#{name}" do |val|
          JSON.parse(read_attribute(name.to_sym) || '[]')
        end
      end
    end
  end
end
