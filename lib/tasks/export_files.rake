class Exporter

  def clean_tags(*tag_names)
    puts "Removing other tags from photos tagged #{tag_names.to_sentence}."
    tag_names.each { |e| clean_tag e }
  end

  def export_by_tag
    puts "Exporting photos by tag."
    Photo.find_each { |e| export_photo e }
    puts ""
  end

  def confirm_tally
    if exported_files.count == Photo.count
      puts "Everything looks good!"
    else
      puts "Count doesn't match. " +
           "#{exported_files.count} files exported. " +
           "#{Photo.count} files in database."
    end
  end

  private

  def clean_tag(tag_name)
    tag_name = tag_name.to_s.humanize.downcase
    tag = Tag.find_by_name(tag_name)
    Photo.tagged(tag_name).each { |e| e.update(tags: [tag]) }
  end

  def export_photo(photo)
    export_dir = FileUtils.mkpath File.join( tagged_photos_dir, photo_tags(photo) )
    FileUtils.copy photo.path, File.join(export_dir, photo.filename)
    print "."
  end

  def photo_tags(photo)
    if photo.tags.present?
      photo.tags.map(&:name).sort.join(", ")
    else
      "untagged"
    end
  end

  def tagged_photos_dir
    @tagged_photos_dir ||= FileUtils.mkpath(
      File.join(Dir.home, "Desktop", "Tagged Photos")
    )
  end

  def exported_files
    @exported_files ||= begin
      files_and_folders = Dir[File.join(tagged_photos_dir, "**", "*")]
      files_and_folders.select { |f| File.file? f }
    end
  end

end


desc "Copy photos into folders by tags"
task export_files: :environment do
  exporter = Exporter.new
  exporter.clean_tags :delete, :misfiled
  exporter.export_by_tag
  exporter.confirm_tally
end
