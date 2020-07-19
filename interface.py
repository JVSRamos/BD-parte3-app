import tkinter as tk                # python 3
from tkinter import font as tkfont  # python 3


colors = {
    "main": "#073b4c",
    "sec": "#ffbd00",
    "black": "#012622",
    "white": "#ece5f0",
}

cadastro_title = 'CADASTRAR VEÍCULO'
busca_title = 'ENCONTRAR TRANSPORTADORES'


class GUI(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)

        self.title("Bifão Manager")

        self.xg_font = tkfont.Font(
            family='Verdana', size=36, weight="bold", slant='italic')

        self.lg_font = tkfont.Font(
            family='Verdana', size=24, weight="bold")

        self.m_font = tkfont.Font(family='Verdana', size=20)

        self.sm_font = tkfont.Font(family='Verdana', size=16)

        self.geometry("900x600")

        # the container is where we'll stack a bunch of frames
        # on top of each other, then the one we want visible
        # will be raised above the others
        container = tk.Frame(self)
        # occupies all the space
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        self.frames = {}
        for F in (Inicio, Cadastro, Busca):
            page_name = F.__name__
            frame = F(parent=container, controller=self)
            self.frames[page_name] = frame

            # put all of the pages in the same location;
            # the one on the top of the stacking order
            # will be the one that is visible.
            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame("Inicio")

    def show_frame(self, page_name):
        '''Show a frame for the given page name'''
        frame = self.frames[page_name]
        frame.tkraise()


class Inicio(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        # set window color
        self['bg'] = colors['main']

        bifao_text = tk.Label(self, text="BIFÃO MUDANÇAS",
                              font=controller.xg_font,
                              background=colors['main'],
                              foreground=colors['sec']
                              )
        bifao_text.pack(side="top", fill="x", pady=60)

        selecione_text = tk.Label(self, text="BEM-VINDO! SELECIONE UMA AÇÃO:",
                                  font=controller.lg_font,
                                  background=colors['main'],
                                  foreground=colors['sec']
                                  )
        selecione_text.pack(side="top", fill="x")

        button_container = tk.Frame(self, background=colors['main'])
        button_container.pack(fill="both", expand=True, pady=10)

        button1 = tk.Button(button_container, text=cadastro_title,
                            bg=colors['sec'],
                            fg=colors['black'],
                            font=controller.m_font,
                            command=lambda: controller.show_frame("Cadastro")
                            )

        button2 = tk.Button(button_container, text=busca_title,
                            bg=colors['sec'],
                            fg=colors['black'],
                            font=controller.m_font,
                            command=lambda: controller.show_frame("Busca")
                            )

        xpad = 100
        ypad = 50
        iypad = 10
        button1.pack(side='top', fill='x', padx=xpad, pady=ypad, ipady=iypad)
        button2.pack(side='top', fill='x', padx=xpad, ipady=iypad)


class Cadastro(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        # set window color
        self['bg'] = colors['main']

        text = tk.Label(self, text=cadastro_title,
                        font=controller.lg_font,
                        background=colors['main'],
                        foreground=colors['sec']
                        )
        text.pack(side="top", fill="x", pady=30)

        welcome_text = tk.Label(self, text="Olá Carlos Bife! Qual veículo você gostaria de cadastrar hoje?",
                                font=controller.m_font,
                                background=colors['main'],
                                foreground=colors['sec']
                                )
        welcome_text.pack(side="top", fill="x", pady=0)

        query_container = tk.Frame(self, background=colors['main'])
        query_container.pack(fill="x", expand=True,
                             pady=0, padx=40)

        input_container = tk.Frame(query_container, background=colors['main'])
        input_container.pack(side='left', ipadx=60)

        send_button = tk.Button(query_container, text="ENVIAR",
                                bg=colors['sec'],
                                fg=colors['black'],
                                font=controller.sm_font,
                                command=lambda: self.send_data(
                                    placa_e, marca_e, modelo_e, ano_e)
                                )
        send_button.pack(side='right', padx=40, ipady=10, ipadx=100)

        # inputs: placa, marca, modelo e ano
        placa_f = tk.Frame(input_container, bg=colors['main'])
        placa_l = tk.Label(
            placa_f, bg=colors['main'], fg=colors['sec'], text="Placa", font=controller.sm_font)
        placa_e = tk.Entry(placa_f, bg=colors['white'])
        marca_f = tk.Frame(input_container, bg=colors['main'])
        marca_l = tk.Label(
            marca_f, bg=colors['main'], fg=colors['sec'], text="Marca", font=controller.sm_font)
        marca_e = tk.Entry(marca_f, bg=colors['white'])
        modelo_f = tk.Frame(input_container, bg=colors['main'])
        modelo_l = tk.Label(
            modelo_f, bg=colors['main'], fg=colors['sec'], text="Modelo", font=controller.sm_font)
        modelo_e = tk.Entry(modelo_f, bg=colors['white'])
        ano_f = tk.Frame(input_container, bg=colors['main'])
        ano_l = tk.Label(
            ano_f, bg=colors['main'], fg=colors['sec'], text="Ano", font=controller.sm_font)
        ano_e = tk.Entry(ano_f, bg=colors['white'])

        ypad = 13
        iypad = 8
        ixpad = 80

        placa_f.pack(side='top', expand=True, pady=ypad,
                     ipady=iypad, ipadx=ixpad)
        placa_l.pack(side='left')
        placa_e.pack(side='right', ipady=iypad, ipadx=ixpad/2)
        marca_f.pack(side='top', expand=True, pady=ypad,
                     ipady=iypad, ipadx=ixpad)
        marca_l.pack(side='left')
        marca_e.pack(side='right', ipady=iypad, ipadx=ixpad/2)
        modelo_f.pack(side='top', expand=True, pady=ypad,
                      ipady=iypad, ipadx=ixpad)
        modelo_l.pack(side='left')
        modelo_e.pack(side='right', ipady=iypad, ipadx=ixpad/2)
        ano_f.pack(side='top', expand=True, pady=ypad,
                   ipady=iypad, ipadx=ixpad)
        ano_l.pack(side='left')
        ano_e.pack(side='right', ipady=iypad, ipadx=ixpad/2)

        button_container = tk.Frame(self, background=colors['main'])
        button_container.pack(side='bottom', fill="x", pady=30)

        back_button = tk.Button(button_container, text="VOLTAR",
                                bg=colors['sec'],
                                fg=colors['black'],
                                font=controller.sm_font,
                                command=lambda: controller.show_frame(
                                    "Inicio")
                                )
        back_button.pack(side='left', padx=30, ipady=0)

    def send_data(self, placa, marca, modelo, ano):
        # CPF do Carlos...
        CPF = 48121548421
        # normalmente, o sistema saberia isso por meio de tecnologias como cookies.
        # Por simplicidade, decidimos fazer para um prestador já logado no sistema,
        # além de fazer a Foto1 hardcoded (já que o objetivo não é fazer uma interface complexa).
        data = {}
        data['placa'] = placa.get()
        data['prestador'] = CPF
        data['marca'] = marca.get()
        data['modelo'] = modelo.get()
        data['ano'] = ano.get()
        data['foto1'] = f"./photos/vehicles/{placa.get()}-1.jpeg"
        # errors = insert(data)
        errors = ['CEIS', 'TAO', 'DE', 'SACANAGEM']
        if (errors):
            tk.messagebox.showerror(
                "Um ou mais erros foram identificados", errors)
        print(data, errors)


class Busca(tk.Frame):

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        # set window color
        self['bg'] = colors['main']

        text = tk.Label(self, text=busca_title,
                        font=controller.lg_font,
                        background=colors['main'],
                        foreground=colors['sec']
                        )
        text.pack(side="top", fill="x", pady=30)

        welcome_text = tk.Label(self, text="Digite a carga minima necessaria",
                                font=controller.m_font,
                                background=colors['main'],
                                foreground=colors['sec']
                                )
        welcome_text.pack(side="top", fill="x", pady=0)

        query_container = tk.Frame(self, background=colors['main'])
        query_container.pack(fill="x", expand=True,
                             pady=0, padx=40)

        input_container = tk.Frame(query_container, background=colors['main'])
        input_container.pack(side='left', ipadx=60)

        send_button = tk.Button(query_container, text="ENVIAR",
                                bg=colors['sec'],
                                fg=colors['black'],
                                font=controller.sm_font,
                                command=lambda: self.send_data()
                                )
        send_button.pack(side='right', padx=0, ipady=0)

        button_container = tk.Frame(self, background=colors['main'])
        button_container.pack(side='bottom', fill="x", pady=30)

        carga_f = tk.Frame(input_container, bg=colors['main'])
        carga_l = tk.Label(
            carga_f, bg=colors['main'], fg=colors['sec'], text="Carga", font=controller.sm_font)
        carga_e = tk.Entry(carga_f, bg=colors['white'])

        back_button = tk.Button(button_container, text="VOLTAR",
                                bg=colors['sec'],
                                fg=colors['black'],
                                font=controller.sm_font,
                                command=lambda: controller.show_frame(
                                    "Inicio")
                                )
        back_button.pack(side='left', padx=30, ipady=0)

        carga_f.pack(side='left')
        carga_l.pack(side='left')
        carga_e.pack(side='left')

        scrollbar = tk.Scrollbar(self)
        scrollbar.pack(side='right', fill='y')
        textbox = tk.Text(self)

        textbox.pack()

        textbox.insert('e', "XUPA JAO SEU FILHO DA PUTA\n")
        # attach textbox to scrollbar
        textbox.config(yscrollcommand=scrollbar.set)
        scrollbar.config(command=textbox.yview)

    def send_data(self):
        print("Pesquisei")


if __name__ == "__main__":
    bd_gui = GUI()
    bd_gui.mainloop()
