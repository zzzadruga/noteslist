package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.zzzadruga.model.Note;
import ru.zzzadruga.service.NoteService;

@Controller
@RequestMapping(value = {"/", "/notes"})
public class NoteController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String notesList(Model model){
        Page<Note> page = noteService.getPage(0, null);
        model.addAttribute("notesList", page.getContent());
        return "notes";
    }
    @RequestMapping(value = "/edit/{id}", produces = "text/plain;charset=UTF-8")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("noteModel", noteService.getNoteById(id));
        return "edit";
    }
}
