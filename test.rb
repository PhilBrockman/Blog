fork { puts "child: #{$$}"; exec "bash" }; puts "parent: #{$$}"; sleep 10
