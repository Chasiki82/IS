import tkinter as tk
import pymysql
from tkinter import *
from tkinter import ttk

# Создание окна приложения
root = tk.Tk()
root.title("ИС <СамПГУ>")
w = root.winfo_screenwidth()
h = root.winfo_screenheight()
w = w // 2 - 500
h = h // 2 - 225
root.geometry(f'1000x450+{w}+{h}')


# Создание формы для ввода данных
input_frame = tk.Frame(root)
input_frame.pack(side=tk.TOP)

# Создание поля для ввода sql-запросов
query_frame = tk.Frame(root)
query_frame.pack(side=tk.TOP)

query_label = tk.Label(query_frame, text="Поле ввода:")
query_label.pack(side=tk.LEFT)

query_entry = tk.Entry(query_frame)
query_entry.pack(side=tk.LEFT)

var = StringVar()
combobox = ttk.Combobox(query_frame, textvariable=var)
combobox['values'] = ('disciplines', 'gryppa', 'kafedra', 'specialnost', 'student', 'studentcard', 'teacher', 'teachercard')
combobox['state'] = 'readonly'
combobox.pack(side=tk.LEFT)
# Создание кнопок для выполнения операций
button_frame = tk.Frame(root)
button_frame.pack(side=tk.TOP)

add_button = tk.Button(button_frame, activebackground='blue', text="Добавить")
add_button.pack(side=tk.LEFT)

#update_button = tk.Button(button_frame, activebackground='blue', text="Обновить")
# update_button.pack(side=tk.LEFT)

delete_button = tk.Button(button_frame, activebackground='blue', text="Удалить")
delete_button.pack(side=tk.LEFT)

query_button = tk.Button(button_frame, activebackground='blue', text="Выполнить запрос")
query_button.pack(side=tk.LEFT)


# Создание поля для вывода результатов
result_frame = tk.Frame(root)
result_frame.pack(side=tk.TOP)

result_label = tk.Label(result_frame, text="Результаты:")
result_label.pack(side=tk.LEFT)

result_text = tk.Text(result_frame, height=20, width=100, wrap=WORD)
result_text.pack(side=tk.LEFT)

# Подключение к базе данных
db = pymysql.connect(host="127.0.0.1",
                     user="root",
                     password="",
                     db="bd_kursach_2")

# Создание курсора для выполнения операций с базой данных
cursor = db.cursor()

def stl_table():
    item = ''
    for i in cursor.description:
        item += ' '+i[0]+','
    item1 = '('+item[1:-1]+')'
    return item1
def text_plus():
    text_SQL = query_entry.get()
    item = ''
    for i in text_SQL.split('|'):
        item += "'"+i+"', "
    item1 = item[0:-2]
    return item1.replace('\n', '')
# Функция для добавления записи в базу данных
def add_record():
    cursor.execute(f"INSERT INTO {str(var.get())} {stl_table()} VALUES({text_plus()})")
    rows_exit()
# Функция для обновления записи в базе данных
# def update_record():
#     sql = "UPDATE table_name SET =%s, =%s WHERE =%s"
#
#     cursor.execute(sql)
#     db.commit()
#     result_text.insert(tk.END, "Запись обновлена\n")
# Функция для удаления записи из базы данных
def delete_record():
    result_text.delete("1.0", END)
    text_SQL = query_entry.get()
    cursor.execute(f"DELETE FROM {str(var.get())} WHERE {str(cursor.description[0][0])}={text_SQL}")
    rows_exit()

#Функция вывод при выполнении удалния и добавления
def rows_exit(*arg):
    result_text.delete("1.0", END)
    cursor.execute(f"SELECT * FROM {str(var.get())}")  # представление текста как запрос sql
    result = cursor.fetchall()  # запрос из бд
    db.commit()
    # rows = rows.replace("), (", ") \n(")

    for i in cursor.description:
        result_text.insert(END,  f"{i[0]} | ")
    for row in result:
        result_text.insert(tk.END, "\n")
        result_text.insert(tk.END, row)


# Функция для выполнения sql-запроса
def run_query():
    result_text.delete("1.0", END)
    query = query_entry.get()
    cursor.execute(query)
    result = cursor.fetchall()
    for i in cursor.description:
        result_text.insert(END,  f"{i[0]} | ")
    for row in result:
        result_text.insert(tk.END, "\n")
        result_text.insert(tk.END, row)

    result_text.insert(tk.END, "Запрос выполнен\n")


# Привязка функций к кнопкам
add_button.config(command=add_record)
# update_button.config(command=update_record)
delete_button.config(command=delete_record)
query_button.config(command=run_query)
var.trace('w', rows_exit)
# Запуск приложения
root.mainloop()

# Закрытие соединения с базой данных
db.close()