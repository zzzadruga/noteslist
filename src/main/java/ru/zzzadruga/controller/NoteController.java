package ru.zzzadruga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import ru.zzzadruga.model.Note;
import ru.zzzadruga.service.NoteService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = {"/", "/notes"})
public class NoteController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String notesList(@RequestParam(name = "p", defaultValue = "1") int pageNumber,
                            @RequestParam(name = "done", defaultValue = "") String stringDone,
                            Model model){
        Boolean done = stringDone.isEmpty() ? null : stringDone.equals("true");
        Page<Note> page = noteService.getPage(pageNumber - 1, done);
        model.addAttribute("notesList", page.getContent());
        return "notes";
    }
    @RequestMapping(value = "/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("noteModel", noteService.getNoteById(id));
        return "edit";
    }
    @RequestMapping(value = "/addNote", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("noteModel") Note note) {
        noteService.save(note);
        return "redirect:/notes/list";
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}
