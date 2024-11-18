import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'docker-project';
   tasks: { title: string; completed: boolean }[] = [];
  newTask: string = '';

  // Add a new task
  addTask() {
    if (this.newTask.trim()) {
      this.tasks.push({ title: this.newTask, completed: false });
      this.newTask = '';
    }
  }

  // Toggle completion status of a task
  toggleTaskCompletion(index: number) {
    this.tasks[index].completed = !this.tasks[index].completed;
  }

  // Delete a task
  deleteTask(index: number) {
    this.tasks.splice(index, 1);
  }
}
