import tkinter as tk
import pymysql

# Создание окна приложения
root = tk.Tk()
root.title("База данных")

# Создание формы для ввода данных
input_frame = tk.Frame(root)
input_frame.pack(side=tk.TOP)

# Создание поля для ввода sql-запросов
query_frame = tk.Frame(root)
query_frame.pack(side=tk.TOP)

query_label = tk.Label(query_frame, text="SQL-запрос:")
query_label.pack(side=tk.LEFT)

query_entry = tk.Entry(query_frame)
query_entry.pack(side=tk.LEFT)

# Создание кнопок для выполнения операций
button_frame = tk.Frame(root)
button_frame.pack(side=tk.TOP)

add_button = tk.Button(button_frame, text="Добавить")
add_button.pack(side=tk.LEFT)

update_button = tk.Button(button_frame, text="Обновить")
update_button.pack(side=tk.LEFT)

delete_button = tk.Button(button_frame, text="Удалить")
delete_button.pack(side=tk.LEFT)

query_button = tk.Button(button_frame, text="Выполнить запрос")
query_button.pack(side=tk.LEFT)

# Создание поля для вывода результатов
result_frame = tk.Frame(root)
result_frame.pack(side=tk.TOP)

result_label = tk.Label(result_frame, text="Результаты:")
result_label.pack(side=tk.LEFT)

result_text = tk.Text(result_frame)
result_text.pack(side=tk.LEFT)

# Подключение к базе данных
db = pymysql.connect(host="127.0.0.1", user="root", password="", db="bd_kursach_2")

# Создание курсора для выполнения операций с базой данных
cursor = db.cursor()


# Функция для добавления записи в базу данных
def add_record():
    sql = "INSERT INTO table_name (, , ) VALUES (%s, %s, %s)"

    cursor.execute(sql)
    db.commit()

    result_text.insert(tk.END, "Запись добавлена\n")


# Функция для обновления записи в базе данных
def update_record():
    sql = "UPDATE table_name SET =%s, =%s WHERE =%s"

    cursor.execute(sql)
    db.commit()

    result_text.insert(tk.END, "Запись обновлена\n")


# Функция для удаления записи из базы данных
def delete_record():
    sql = "DELETE FROM table_name WHERE =%s"

    cursor.execute(sql)
    db.commit()

    result_text.insert(tk.END, "Запись удалена\n")


# Функция для выполнения sql-запроса
def run_query():
    query = query_entry.get()

    cursor.execute(query)
    result = cursor.fetchall()

    for row in result:
        result_text.insert(tk.END, row)
        result_text.insert(tk.END, "\n")

    result_text.insert(tk.END, "Запрос выполнен\n")


# Привязка функций к кнопкам
add_button.config(command=add_record)
update_button.config(command=update_record)
delete_button.config(command=delete_record)
query_button.config(command=run_query)

# Запуск приложения
root.mainloop()

# Закрытие соединения с базой данных
db.close()