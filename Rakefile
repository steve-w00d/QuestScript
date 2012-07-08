desc "Runs jshint on all the Questscript .js files, using the config at .jshint"
task :hint do
	sh "./node_modules/.bin/jshint ./js/"
end

desc "Concatinates and minifies the relevant javascript files into ./static/pup.js"
task :js do
	src_dir = "#{pwd}/js"
	dest_dir = "#{pwd}/static"

	# grab all the files to concatinate
	# cmd = sprocketize --directory=#{src_dir} -I dummy.js #{to_sprocketize.join(" ")}"
	# sh "#{cmd} > #{dest_dir}/quest.js"
	# sh "#{cmd} | uglifyjs > #{dest_dir}/quest.min.js"
end

desc "Start Sinatra"
task :start do
	sh "ruby quest.rb"
end

desc "Compile assets and run Sinatra app"
task :run_all => [:js, :start]
