﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Microtech_Task.Models;

public partial class Account
{
    [Key]
    public int Acc_number { get; set; }

    public int? Acc_parent { get; set; }
    public decimal? Balance { get; set; }

    public virtual ICollection<Account> Children { get; set; }
    public virtual Account Parent { get; set; }



}