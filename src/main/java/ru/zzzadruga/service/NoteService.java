package ru.zzzadruga.service;

import org.springframework.data.domain.Page;
import ru.zzzadruga.model.Note;

public interface NoteService {
    void save(Note note);
    Note getNoteById(long id);
    void remove(long id);
    Page<Note> getPage(int pageNumber, Boolean done);
}
