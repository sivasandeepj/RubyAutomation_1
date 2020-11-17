class LandingPage

  include PageObject

  #Page Objects
  button(:btn_login, class:'mat-focus-indicator mat-raised-button mat-button-base ng-star-inserted',visible:true,index: -1)
  button(:btn_singup, class:'mat-focus-indicator mat-raised-button mat-button-base ng-star-inserted',visible:true,index: -1)

  def navigate_to_landing_page
    navigate_to construct_page_url
  end

  def construct_page_url
    _route = case ENV['ExecutionEnv']
            when 'local'
              FigNewton.local_url
            when 'dev'
              FigNewton.dev_url
            when 'staging'
              FigNewton.staging_url
            when 'pref'
              FigNewton.perf_url
              else
                FigNewton.staging_url
              #raise "System Variable 'ExecutionEnv' has not been defined for execution. ExecutionEnv should be 'local','dev','staging' or 'perf'. Define a system variable ExecutionEnv  "
            end
  end

  def click_login
    btn_login_element
  end

end