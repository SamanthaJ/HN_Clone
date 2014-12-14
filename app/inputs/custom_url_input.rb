class CustomUrlInput < SimpleForm::Inputs::Base

  def input
    custom_url_html + custom_url_js_script
  end
  
  def custom_url_js_script
    "<script type='text/javascript'>
    $('##{input_class}').bind('input', function() {
      value = $($(this)).val();
      if (value.search('https://') == 0) {
        $($(this)).val(value.replace('https://',''));
        $('span.#{input_class}').html('https://');
        } else {
          $($(this)).val(value.replace('http://',''));
          $('span.#{input_class}').html('http://');
        }
        })
</script>
".html_safe
end

def custom_url_html
  "<div class='input-group'>
  <span class='input-group-addon #{input_class}'>http://</span>
  <input type='text' id='#{input_class}' name='#{object_name}[#{attribute_name.to_s}]' class='form-control' value='#{object.try(:"#{attribute_name}")}'>
  </div>".html_safe
end

end