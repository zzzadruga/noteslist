package ru.zzzadruga.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.zzzadruga.model.Note;

public interface NoteRepository extends JpaRepository<Note, Long>{
    Page<Note> findNoteByDoneIsTrue(Pageable pageable);
    Page<Note> findNoteByDoneIsFalse(Pageable pageable);
}
