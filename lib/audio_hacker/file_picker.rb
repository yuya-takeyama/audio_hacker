module AudioHacker
  class FilePicker
    def pick(directory_definitions, track)
      directory_definitions[track.directory - 1].files[track.file - 1]
    end
  end
end
