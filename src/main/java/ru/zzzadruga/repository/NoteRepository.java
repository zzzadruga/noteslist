package ru.zzzadruga.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.zzzadruga.model.Note;

public interface NoteRepository extends JpaRepository<Note, Long>{
    Page<Note> findNoteByDoneIsTrueOrderByCreatedDateAsc(Pageable pageable);
    Page<Note> findNoteByDoneIsTrueOrderByCreatedDateDesc(Pageable pageable);
    Page<Note> findNoteByDoneIsFalseOrderByCreatedDateAsc(Pageable pageable);
    Page<Note> findNoteByDoneIsFalseOrderByCreatedDateDesc(Pageable pageable);
    Page<Note> findAllByOrderByCreatedDateAsc(Pageable pageable);
    Page<Note> findAllByOrderByCreatedDateDesc(Pageable pageable);
}
