class JsonAttrAccessor
  def initialize(*list)
    @opts = list.pop if list.last.kind_of?(Hash)
    @opts ||= {}
    @list = list
  end

  def module
    list = @list
    Module.new do
      list.each do |name|
        define_method :"#{name}=" do |val|
          write_attribute(name.to_sym, (val || {}).to_json)
        end

        define_method :"#{name}" do 
          JSON.parse(read_attribute(name.to_sym) || '{}')
        end
      end
    end
  end
end
