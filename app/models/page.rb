class Page < ApplicationRecord
  belongs_to :company
  belongs_to :design

  def to_html
    d = design
    html = d.layout.content.gsub(/\<%= content %\>/, d.content)

    html = html.gsub(/\<%= +title +%\>/, title)
    JSON.parse(content).each do |key, val|
      html = html.gsub(/\<%= +#{key} +%\>/, val.gsub(/\n/, '<br>'))
    end

    html.html_safe
  end
end
