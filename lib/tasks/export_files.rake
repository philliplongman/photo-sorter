desc "Copy photos into folders by tags"
task export_files: :environment do

  puts "Removing other tags from deleted and misfiled photos."

  delete_tag   = Tag.find_by_name "delete"
  misfiled_tag = Tag.find_by_name "misfiled"
  Photo.tagged("delete").each   { |photo| photo.update tags: [delete_tag]   }
  Photo.tagged("misfiled").each { |photo| photo.update tags: [misfiled_tag] }

  puts "Exporting photos by tag."

  batch_export_path = File.join(Dir.home, "Desktop", "Tagged Photos")

  Photo.all.each do |photo|
    tags = photo.tags.order(:name).map(&:name).join(", ")
    export_dir = File.join(batch_export_path, tags)
    FileUtils.makedirs export_dir

    export_path = File.join(export_dir, photo.filename)
    FileUtils.copy photo.path, export_path
    print "."
  end
  puts ""

  exported_files = Dir[File.join(batch_export_path, "**", "*")].select { |f| File.file? f }

  if exported_files.count == Photo.count
    puts "Everything looks good!"
  else
    puts "Count doesn't match. #{exported_files.count} files exported. #{Photo.count} files in database."
  end
end
