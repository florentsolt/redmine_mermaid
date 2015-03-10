Redmine::Plugin.register :redmine_mermaid do
  name 'Redmine Mermaid plugin'
  author 'Florent Solt'
  description ' Generation of diagram and flowchart from text in a similar manner as markdown'
  version '0.0.1'
  url 'https://github.com/florentsolt/redmine_mermaid'
end


Redmine::WikiFormatting::Macros.macro :diagram do |obj, args, text|
  ("<div class='mermaid'>\n#{text}\n</div>" +
    "<script>if (document.readyState === 'complete') { mermaid.init(); }</script>"
    ).html_safe
end

class MermaidViewListener < Redmine::Hook::ViewListener
  # Adds javascript and stylesheet tags
  def view_layouts_base_html_head(context)
    javascript_include_tag("mermaid.full.js", :plugin => "redmine_mermaid")
  end
end

module Redmine::WikiFormatting::Textile::Helper
  def heads_for_wiki_formatter_with_diagram
    heads_for_wiki_formatter_without_diagram
    unless @heads_for_wiki_formatter_with_diagram_included
      content_for :header_tags do
        javascript_include_tag('jstoolbar', :plugin => 'redmine_mermaid')
      end
      @heads_for_wiki_formatter_with_diagram_included = true
    end
  end

  alias_method_chain :heads_for_wiki_formatter, :diagram
end
