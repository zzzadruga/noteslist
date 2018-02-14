package ru.zzzadruga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.zzzadruga.model.Note;
import ru.zzzadruga.repository.NoteRepository;

@Service
public class NoteServiceImpl implements NoteService {

    @Autowired
    private NoteRepository noteRepository;

    private final static int PAGESIZE = 10;

    public void save(Note note) { noteRepository.save(note); }

    public Note getNoteById(long id) { return noteRepository.findOne(id); }

    public void remove(long id) { noteRepository.delete(id); }

    public Page<Note> getPage(int pageNumber, String searchString) {
        PageRequest request = new PageRequest(pageNumber, PAGESIZE);
        Page<Note> page = (searchString != null ? noteRepository.findNoteByTitleLikeOrTextLike("%" + searchString + "%", "%" + searchString + "%", request) : noteRepository.findAll(request));
        return page;
    }
}
