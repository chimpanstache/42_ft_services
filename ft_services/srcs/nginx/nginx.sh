# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ehafidi <ehafidi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 12:06:34 by ehafidi           #+#    #+#              #
#    Updated: 2021/01/29 12:09:40 by ehafidi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# exec telegraf-1.17.2/usr/bin/telegraf $@
telegraf &
/usr/sbin/sshd

nginx -g 'daemon off;'
