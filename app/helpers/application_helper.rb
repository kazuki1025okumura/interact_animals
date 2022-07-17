module ApplicationHelper
  def page_title(page_title = '', admin = false)
    base_title = if admin
                  'FLUFF NAVI(管理画面)'
                 else
                  'FLUFF NAVI'
                 end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end