desc "Runs jshint on all the Questscript .js files, using the config at .jshint"
task :hint do
	sh "./node_modules/.bin/jshint ./js/"
end

desc "Start Sinatra"
task :start do
	sh "ruby quest.rb"
end

desc "Compile assets and run Sinatra app"
task :run_all => [:js, :start]
