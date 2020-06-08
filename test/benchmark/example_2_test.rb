require 'erb'
require 'haml'
require 'slim'
require 'benchmark'
require 'ostruct'

notes = OpenStruct.new title: 'Write an essay', description: 'My essay is about...', randomList: (0..50).to_a.sort{ rand() - 0.5 }[0..10000] 

erb_example = <<-ERB_EXAMPLE
<span><%= notes.title %></span>
<span><%= notes.description %></span>
<table>
  <tr>
    <% notes.randomList.each do |note| %>
      <td><%= note %></td>
    <% end %>
  </tr>
</table>
ERB_EXAMPLE

slim_example = <<-SLIM_EXAMPLE
span= notes.title
span= notes.description
table
  tr
    - notes.randomList.each do |note|
      td= note
SLIM_EXAMPLE

haml_example = <<-HAML_EXAMPLE
%span= notes.title
%span= notes.description
%table
  %tr
    - notes.randomList.each do |note|
      %td= note
HAML_EXAMPLE

context = OpenStruct.new notes: notes
__result = ''

Benchmark.bmbm(20) do |bcmk|
  bcmk.report("erb_test") { (1..2000).each { ERB.new(erb_example, 0, '-', '__result').result binding } }
  bcmk.report("slim_test") { (1..2000).each{ __result = Slim::Template.new { slim_example }.render(context) } }
  bcmk.report("haml_test") { (1..2000).each { __result = Haml::Engine.new(haml_example).render(binding) } }
end