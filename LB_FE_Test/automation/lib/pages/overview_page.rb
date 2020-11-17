class OverviewPage

  include PageObject
  include DataMagic

  #pageobjects
  div(:div_userInfo, text:'User Info')
  div(:div_apiKeys, text:'API Keys')
  div(:div_userGuides, text:'User Guides')
  div(:div_popup, class:'welcome__heading__close')
  div(:div_showToolTip, class: 'mat-slide-toggle-thumb', index: -1)
  button(:btn_project, class: 'mat-focus-indicator mat-icon-button mat-button-base')
  div(:div_operations, text:'Operations')
  div(:div_changelogs, text:'Changelogs')
  div(:div_changesets, text:'Changesets')
  div(:div_connections, text:'Connections')
  a(:a_eula, text:'EULA')

  def initialize_page
    @side_nav_element = browser.elements(class: 'sidenav__context__item__icon')
  end

  def navigate_via_settings(_destination_page, _from_navigation_element)
    wait_for_page_load
    close_pop_up
    toggle_show_tooltips
    click_side_nav_element(_from_navigation_element)
    click_inner_side_nav_element(_destination_page)
  end

  def click_side_nav_element(_text)
    @count = @side_nav_element.count
    _side_nav_index = 0
    while(_side_nav_index < @count) do
      @text = @side_nav_element[_side_nav_index].element.text
      if @text == _text
        @side_nav_element[_side_nav_index].parent.click
        return
      end
      _side_nav_index = _side_nav_index+1
    end
  end

  def click_inner_side_nav_element(_destination_page)
    #div_userGuides_element.wait_until_present(5)
    case _destination_page
    when 'User Info'
      div_userInfo_element.click
    when 'API Keys'
      div_apiKeys_element.click
    when 'User Guides'
      div_userGuides_element.click
    when 'Operations', 'Changelogs', 'Changesets', 'Connections'
      click_inner_side_navs_under_account_tree(_destination_page)
    end
  end

  def click_inner_side_navs_under_account_tree(_destination_page)
    btn_project_element.click()
    case _destination_page
    when 'Operations'
      div_operations_element.click
    when 'Changelogs'
      div_changelogs_element.click
    when 'Changesets'
      div_changesets_element.click
    when 'Connections'
      div_connections_element.click
    end
    sleep 2
  end

  def close_pop_up
    div_popup_element.wait_until_present(5)
    if div_popup_element.button.present?
      div_popup_element.button.click
    end
  end

  def wait_for_page_load
    a_eula_element.wait_until_present(5)
  end

  def toggle_show_tooltips
    div_showToolTip_element.click
  end



end