class ProjectOperations
  include PageObject
  include DataMagic
  include ::RSpec::Matchers

  #pageobjects
  span(:span_result, text:'Result')
  span(:span_no_operations, class:'mat-content ng-tns-c121-33')

  def initialize_page
    @operations_expansion_panel = browser.element(id:'mat-expansion-panel-header-1')
    @operations_expansionpanel_child = browser.div(id:'cdk-accordion-child-1')
  end

  def filter_dropdown(_dropdown, _value)
    case _dropdown
    when 'Result'
      select_value_from_result_dropdown(_value)
    end
  end

  def select_value_from_result_dropdown(_value)
    span_result_element.click
    browser.element(text: _value).click
  end

  def verify_operations_dropdown_value(_value)
    DataMagic.load('assertionsTexts.yml')

    _assert_text = data_for(:Operations_page)['no_operations_to_display']
    puts  _assert_text
    @operations_expansion_panel.click
    expect(@operations_expansionpanel_child.text).to eq(_assert_text)
  end

  def wait_for_page_load
  end



end