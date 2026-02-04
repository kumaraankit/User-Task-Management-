import { Injectable, NotFoundException } from '@nestjs/common';
import { v4 as uuidv4 } from 'uuid';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
    private items: any[] = [];

    findAll() {
        return this.items;
    }

    findOne(id: string) {
        const item = this.items.find((i) => i.id === id);
        if (!item) throw new NotFoundException('User not found');
        return item;
    }

    create(payload: CreateUserDto) {
        const user = { id: uuidv4(), ...payload };
        this.items.push(user);
        return user;
    }

    update(id: string, payload: UpdateUserDto) {
        const idx = this.items.findIndex((i) => i.id === id);
        if (idx === -1) throw new NotFoundException('User not found');
        this.items[idx] = { ...this.items[idx], ...payload };
        return this.items[idx];
    }

    remove(id: string) {
        const idx = this.items.findIndex((i) => i.id === id);
        if (idx === -1) throw new NotFoundException('User not found');
        this.items.splice(idx, 1);
        return null;
    }
}
