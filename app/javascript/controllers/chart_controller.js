import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

export default class extends Controller {

  static values = {
    pendingPercent: Number
  }

  connect() {
    const canvas = this.element;

    new Chart(canvas, {
      type: 'doughnut',
      data: {
        labels: ['Data 1', 'Data 2'],
        datasets: [{
          data: [this.pendingPercentValue, 100 - this.pendingPercentValue],
          backgroundColor: [
            'rgba(255, 99, 132, 0.8)',
            'rgba(54, 162, 235, 0.8)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
          title: {
            display: true,
            text: 'Interview'
          }
        }
      }
    });

    console.log('Doughnut chart created with random data:', data1, data2);
  }
}
