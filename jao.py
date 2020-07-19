import tkinter as tk                # python 3
from tkinter import font as tkfont  # python 3


class GUI(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)

        self.title("Bifão Mudanças")

        self.title_font = tkfont.Font(
            family='Verdana', size=18, weight="bold", slant="italic")

        self.body_font = tkfont.Font(family='Verdana', size=14)

        # self.geometry("900x600")

        # the container is where we'll stack a bunch of frames
        # on top of each other, then the one we want visible
        # will be raised above the others
        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        self.frames = {}
        for F in (StartPage, PageCadastro, PageBusca):
            page_name = F.__name__
            frame = F(parent=container, controller=self)
            self.frames[page_name] = frame

            # put all of the pages in the same location;
            # the one on the top of the stacking order
            # will be the one that is visible.
            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame("StartPage")

    def show_frame(self, page_name):
        '''Show a frame for the given page name'''
        frame = self.frames[page_name]
        frame.tkraise()


class StartPage(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="SELECIONE A SUA AÇÃO",
                         font=controller.title_font)
        label.pack(side="top", fill="x", pady=10)

        button1 = tk.Button(self, text="CADASTRO",
                            command=lambda: controller.show_frame("PageCadastro"))
        button2 = tk.Button(self, text="BUSCA",
                            command=lambda: controller.show_frame("PageBusca"))
        button1.pack()
        button2.pack()


class PageCadastro(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="CADASTRO",
                         font=controller.title_font)
        label.pack(side="top", fill="x", pady=10)

        label = tk.Label(self, text="Name", font=controller.title_font)
        label.pack()
        entry = tk.Entry(self)
        entry.pack()

        button = tk.Button(self, text="VOLTAR",
                           command=lambda: controller.show_frame("StartPage"))
        button.pack()


class PageBusca(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="BUSCA",
                         font=controller.title_font)
        label.pack(side="top", fill="x", pady=10)
        button = tk.Button(self, text="VOLTAR",
                           command=lambda: controller.show_frame("StartPage"))
        button.pack()


if __name__ == "__main__":
    bd_gui = GUI()
    bd_gui.mainloop()
