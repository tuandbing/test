# from math import pi
#
# x = [1, 2, 3]
# y = [2, 3, 4]
# x += y 等价于 x.extend(y)
# print(x + y)

# append会在x后面添加一个列表元素，而不是将y中的元素依次取出存入x中
# x.append(y)
# print(x)

# x += y
#
# 下面两种方式均可以获取x的排序结果
# 注意x.sort是没有返回值的,并且直接对x进行修改
# 但是sorted(x)则是会返回一个排序好的列表,但是不会对x进行修改
# x.sort()
# print(x)
# print(sorted(x))

# 高级排序:sort可以接收两个可选参数 key 和 reverse
# key 可以将其设置为一个用于排序的函数，用它来为每个元素创建一个键,根据这些键来进行排序

# m = ['monkey', 'sky', 'add', 'aerate', 'abalone']
# m.sort(key=len)
# print(m)

# reverse 选择是否要按相反的顺序对列表进行排序

# print({'{name} is near to {pi}'.format(name='Π', pi=pi)})

# 当变量与替换字段同名，可以采用下面的简写方式
# print(f'Π is near to {pi:.2f}')

# 字典的学习

# people = {
#     'Alice': {
#         'phone': '2341',
#         'addr': 'Foo drive 23'
#     },
#     'Beth': {
#         'phone': '9102',
#         'addr': 'Bar street 42'
#     },
#     'Cecil': {
#         'phone': '3158',
#         'addr': 'Baz avenue 90'
#     }
# }
#
# labels = {
#     'phone': 'phone number',
#     'addr': 'address'
# }
#
# name = input("Name: ")
#
# request = input("Phone number (p) or address (a) ?")

# if request == 'p': key = 'phone'
# if request == 'a': key = 'addr'

# python中的三元运算符与其它语言中的不一样
# key = 'phone' if request == 'p' else 'addr'
#
# if name in people:
#     print("{}'s {} is {}".format(name, labels[key], people[name][key]))

# 直接将字典置空与使用clear的区别
# 如果两个变量都指向一个字典，那么将一个置空不会影响整体
# 但是使用clear的话，则都会变为空
# x = {'name': '馒头'}
# y = x
# x = {}
# print(x)        # {}
# print(y)        # {'name': '馒头'}
# x = y
# print(x)        # {'name': '馒头'}
# x.clear()
# print(x)        # {}
# print(y)        # {}

# 字典的复制(浅复制copy和深复制deepcopy)
# 使用浅复制时，值本身是原件，而不是副本
# 当替换副本中的值时，原件不受影响，但是修改副本中的值时(就地修改而不是替换),原件也会发生变化

# x = {'username': 'admin', 'machines': ['foo', 'bar', 'baz']}
# y = x.copy()
# y['username'] = 'mlh'
# y['machines'].remove('bar')
# print(y)    # {'username': 'mlh', 'machines': ['foo', 'baz']}
# print(x)    # {'username': 'admin', 'machines': ['foo', 'baz']}

# 深复制可以复制值及其包含的所有值等，需要导包from copy import deepcopy
# from copy import deepcopy
#
# d = {'name':['Alfred','Bertrand']}
# c = d.copy()
# dc = deepcopy(d)
#
# d['name'].append('Clive')
#
# print(d)    # {'name': ['Alfred', 'Bertrand', 'Clive']}
# print(c)    # {'name': ['Alfred', 'Bertrand', 'Clive']}
# print(dc)   # {'name': ['Alfred', 'Bertrand']}

# setdefault可以获取与指定键相关联的值，如果字典不包含指定的键，字典中会添加指定的键值对

# d = {}
#
# print(d.setdefault('name', 'N/A'))      # N/A
# print(d)    # {'name': 'N/A'}
# d['name'] = '馒头'
# print(d.setdefault('name', 'N/A'))      # 馒头
# print(d)    # {'name': '馒头'}

# update使用一个字典中的项来更新另一个字典
# d = {
#     'title': 'Python Web Site',
#     'url': 'http://www.python.org',
#     'changed': 'Mar 14 22:09:15 MET 2016'
# }
#
# x = {
#     'title': 'Python Language Website'
# }
# d.update(x)
# {'title': 'Python Language Website', 'url': 'http://www.python.org', 'changed': 'Mar 14 22:09:15 MET 2016'}
# print(d)

