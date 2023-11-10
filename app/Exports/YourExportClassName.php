<?php

namespace App\Exports;
use Illuminate\Support\Collection;
use App\ContactMessage;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class YourExportClassName implements FromCollection, WithHeadings
{
 
    public function collection()
    {
        return ContactMessage::all();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        // Replace this array with your actual column names
        return [
            'id',
            'Name',
            'email',
            'phone',
            'age',
            'gender',
            'marital_status',
            'children',
            'education',
            'passport',
            'abroad_work_experience',
            'jp_lan_exp',
            'type',
            'district',
            'address',
            'student_visa_interest',
            'text_message',
            'created_at',
            
        ];
    }
}