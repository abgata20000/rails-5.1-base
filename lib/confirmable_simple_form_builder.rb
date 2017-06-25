class ConfirmableSimpleFormBuilder < SimpleForm::FormBuilder
  include ActionView::Helpers::TextHelper
  include ERB::Util

  def input(attribute_name, options = {}, &block)
    unless confirming? || @options[:display_only] == true
      @is_display_only = false
      return super
    end
    @is_display_only = true
    result = super
    @is_display_only = false
    result
  end

  def text_field(method, options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    out << template.content_tag(:p, options[:value] || object.send(method), class: "form-control-static")
  end

  def text_area(method, options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    out << template.content_tag(:p, simple_format(h(options[:value] || object.send(method))), input_html_options(method))
  end

  def radio_button(method, tag_value, options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    out << template.label_tag(nil, object.send(method), input_html_options(method))
  end

  def password_field(method, options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    out << template.label_tag(nil, "非表示", input_html_options(method))
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    value = object.send(method).to_s == checked_value.to_s ? "○" : "×"
    out << template.label_tag(nil, value, input_html_options(method))
  end

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    index = collection.index do |item|
      item.send(value_method) == object.send(method)
    end
    text = index != nil ? collection[index].send(text_method) : ""
    out << template.content_tag(:p, text, class: "form-control-static")
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    index = collection.index do |item|
      item.send(value_method) == object.send(method)
    end
    text = index != nil ? collection[index].send(text_method) : ""
    out << template.content_tag(:p, text, class: "form-control-static")
  end

  def select(method, array, options = {}, html_options = {})
    unless display_only?(options)
      return super
    end
    out = template.content_tag(:div, style: "display: none;") do
      template.concat super
    end
    index = array.index do |item|
      item[1] == object.send(method)
    end
    text = index != nil ? array[index][0] : ""
    out << template.content_tag(:p, text, class: "form-control-static")
  end

  def simple_fields_for(*args, &block)
    if object.respond_to?(args[0])
      collection = object.send(args[0])
      if collection.respond_to?(:each)
        collection.each do |o|
          if o.respond_to?(:parent_form_confirming)
            o.parent_form_confirming = confirming?
          end
        end
      else
        if collection.respond_to?(:parent_form_confirming)
          collection.parent_form_confirming = confirming?
        end
      end
    end
    super
  end

  private

  def input_html_options(method)
    options = { class: "display required control-label" }
    options[:class] << " has-warning" if attribute_changed?(method) == true
    options
  end

  def attribute_changed?(method)
    method_change = (method.to_s + "_changed?").to_sym
    object.respond_to?(method_change) && object.send(method_change)
  end

  def display_only?(options)
    confirming? || @is_display_only ||
      options[:display_only] || @options[:display_only]
  end

  def confirming?
    (object.respond_to?(:confirming) &&
      object.send(:confirming?)) ||
      (object.respond_to?(:parent_form_confirming) &&
        object.send(:parent_form_confirming?))
  end
end
